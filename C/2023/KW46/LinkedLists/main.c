#include <stdio.h>
#include <stdbool.h>

typedef struct Node
{
    int data;
    struct Node *pNextNode;
} TNode;

void printList(TNode *pHead)
{
    TNode *newHead = pHead;
    bool notNull = true;
    while (notNull)
    {
        printf("Item's Data: %d\n", newHead->data);
        if (newHead->pNextNode)
        {
            newHead = newHead->pNextNode;
        }
        else
        {
            notNull = false;
        }
    }
}

TNode *lastItem(TNode *pHead)
{
    TNode *newHead = pHead;
    bool notNull = true;
    while (notNull)
    {
        if (newHead->pNextNode)
        {
            newHead = newHead->pNextNode;
        }
        else
        {
            notNull = false;
        }
    }
    return newHead;
}

TNode *initItem(int data)
{
    TNode *listItem = malloc(sizeof(TNode));
    listItem->data = data;
    listItem->pNextNode = NULL;
    return listItem;
};

void listAdd(TNode *pHead, int data)
{
    lastItem(pHead)->pNextNode = initItem(data);
}

TNode *indexToPtr(TNode *pHead, int index)
{
    TNode *pNewHead = pHead;
    for (size_t i = 0; i < index; i++)
    {
        pNewHead = pNewHead->pNextNode;
    }
    return pNewHead;
}
void listInsert(TNode *pHead, int index, int data)
{

    TNode *nodeBeforeInsertion = indexToPtr(pHead, index - 1);
    TNode *nodeAfterInsertion = indexToPtr(pHead, index);

    nodeBeforeInsertion->pNextNode = initItem(data);
    nodeBeforeInsertion->pNextNode->pNextNode = nodeAfterInsertion;
}

void listRemove(TNode *pHead, int index)
{
    TNode *nodeToDeleted = indexToPtr(pHead, index);
    TNode *nodeBeforeDelted = indexToPtr(pHead, index - 1);
    TNode *nodeAfterDelted = indexToPtr(pHead, index + 1);

    free(nodeToDeleted);
    nodeBeforeDelted->pNextNode = nodeAfterDelted;
}

TNode *listGet(TNode *pHead, int index)
{
    return indexToPtr(pHead, index)->data;
}

void listSet(TNode *pHead, int index, int data)
{
    indexToPtr(pHead, index)->data = data;
}

int listLength(TNode *pHead)
{
    TNode *newHead = pHead;
    bool notNull = true;
    int count = 0;
    while (notNull)
    {
        count++;
        if (newHead->pNextNode)
        {
            newHead = newHead->pNextNode;
        }
        else
        {
            notNull = false;
        }
    }
    return count;
}

void listSetAll(TNode *pHead, int data)
{
    TNode *newHead = pHead;
    bool notNull = true;
    while (notNull)
    {
        newHead->data = data;
        if (newHead->pNextNode)
        {
            newHead = newHead->pNextNode;
        }
        else
        {
            notNull = false;
        }
    }
}
void listClear(TNode *pHead)
{
    TNode *current = pHead;
    TNode *next;
    while (current)
    {
        next = current->pNextNode;
        free(current);
        current = next;
    }
}

int main(int argc, char *argv[])
{

    TNode *head = initItem(0);
    for (size_t i = 1; i < 6; i++)
    {
        lastItem(head)->pNextNode = initItem(i);
    }
    listInsert(head, 3, 69);

    // printf("Index 5 is %d\n\n", listGet(head, 3));
    printf("List Length is %d\n\n", listLength(head));

    listSetAll(head, 1);
    //  listRemove(head, 4);
    printList(head);

    printf("Goodbye\n");
    return 0;
}