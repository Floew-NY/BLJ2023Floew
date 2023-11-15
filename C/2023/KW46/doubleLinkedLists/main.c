#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct Node
{
    int data;
    struct Node *pNextNode;
    struct Node *pPrevNode; // Added previous node pointer
} TNode;

void printList(TNode *pHead)
{
    TNode *current = pHead;
    while (current != NULL)
    {
        printf("Item's Data: %d\n", current->data);
        current = current->pNextNode;
    }
}

TNode *lastItem(TNode *pHead)
{
    TNode *current = pHead;
    while (current->pNextNode != NULL)
    {
        current = current->pNextNode;
    }
    return current;
}

TNode *initItem(int data)
{
    TNode *listItem = malloc(sizeof(TNode));
    listItem->data = data;
    listItem->pNextNode = NULL;
    listItem->pPrevNode = NULL;
    return listItem;
}

void listAdd(TNode *pHead, int data)
{
    TNode *last = lastItem(pHead);
    TNode *newItem = initItem(data);
    last->pNextNode = newItem;
    newItem->pPrevNode = last;
}

void listInsert(TNode *pHead, int index, int data)
{
    TNode *current = pHead;
    for (int i = 0; i < index; i++)
    {
        if (current != NULL)
        {
            current = current->pNextNode;
        }
    }

    if (current != NULL)
    {
        TNode *newItem = initItem(data);
        newItem->pNextNode = current;
        newItem->pPrevNode = current->pPrevNode;
        if (current->pPrevNode != NULL)
        {
            current->pPrevNode->pNextNode = newItem;
        }
        current->pPrevNode = newItem;
    }
}

void listRemove(TNode *pHead, int index)
{
    TNode *current = pHead;
    for (int i = 0; i < index; i++)
    {
        if (current != NULL)
        {
            current = current->pNextNode;
        }
    }

    if (current != NULL)
    {
        if (current->pPrevNode != NULL)
        {
            current->pPrevNode->pNextNode = current->pNextNode;
        }
        if (current->pNextNode != NULL)
        {
            current->pNextNode->pPrevNode = current->pPrevNode;
        }
        free(current);
    }
}

int listLength(TNode *pHead)
{
    TNode *current = pHead;
    int count = 0;
    while (current != NULL)
    {
        count++;
        current = current->pNextNode;
    }
    return count;
}

void listSetAll(TNode *pHead, int data)
{
    TNode *current = pHead;
    while (current != NULL)
    {
        current->data = data;
        current = current->pNextNode;
    }
}

void listClear(TNode *pHead)
{
    TNode *current = pHead;
    TNode *next;
    while (current != NULL)
    {
        next = current->pNextNode;
        free(current);
        current = next;
    }
}

int main(int argc, char *argv[])
{
    TNode *head = initItem(0);
    for (int i = 1; i < 6; i++)
    {
        listAdd(head, i);
    }
    listInsert(head, 3, 69);

    printf("List Length is %d\n\n", listLength(head));

    // listSetAll(head, 1);
    printList(head);

    printf("Goodbye\n");
    listClear(head);
    return 0;
}
