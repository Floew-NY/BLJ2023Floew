import { useState } from "react";
import { ListCollection } from "./model";
import Navigator from "./components/Navigator";
import Checklist from "./components/Checklist";
import AddListButton from "./components/AddListButton";

function App() {
  const [listCollection, setListCollection] = useState<ListCollection>({
    lists: [
      {
        name: "List1",
        items: [
          { title: "Item1", dueDate: new Date(), completed: false },
          {
            title: "Item2",
            description: "This is a Description",
            dueDate: new Date(),
            completed: false,
          },
          { title: "Item3", dueDate: new Date(), completed: false },
        ],
      },
      {
        name: "List2",
        items: [
          { title: "Item666", dueDate: new Date(), completed: false },
          {
            title: "Item777",
            description: "this is a diferent description",
            dueDate: new Date(),
            completed: false,
          },
          { title: "Item888", dueDate: new Date(), completed: false },
        ],
      },
    ],
  });
  const [active, setActive] = useState<number>(0);
  const addList = (item: Item) => {
    setListCollection((prev) => {
      return {
        ...prev,
        lists: [
          ...prev.lists.slice(0, active),
          {
            ...prev.lists[active],
            items: [...prev.lists[active].items, item],
          },
          ...prev.lists.slice(active + 1),
        ],
      };
    });
  };
  const deleteItem = (indexToRemove: number) => {
    setListCollection((prev) => {
      const updatedItems = prev.lists[active].items.map(
        (item, indexOfFilter) => {
          if (indexOfFilter != indexToRemove) return item;
          item.completed = true;
          return item;
        }
      );
      return {
        ...prev,
        lists: [
          ...prev.lists.slice(0, active),
          {
            ...prev.lists[active],
            items: updatedItems,
          },
          ...prev.lists.slice(active + 1),
        ],
      };
    });
  };
  return (
    <div className="p-[30px] flex space-y-5 flex-col">
      <h1 className="text-3xl font-bold underline">Checklist App</h1>
      <Navigator
        active={active}
        setActive={setActive}
        createList={addList}
        listCollection={listCollection}
      />
      <AddListButton addList={addList} />
      <Checklist list={listCollection.lists[active]} deleteItem={deleteItem} />
    </div>
  );
}

export default App;
