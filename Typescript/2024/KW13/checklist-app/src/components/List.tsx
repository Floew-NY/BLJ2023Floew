import React, { useEffect, useState } from "react";
import ListItemComponent, { ListItemComponentProps } from "./ListItem";
import { List, ListItem } from "@mui/material";
import { Item, List, List, List } from "../model";

export type ListComponentProps = {
  list: List;
  deleteItem: (index: number) => void;
};

function ListComponent({ list, deleteItem }: ListComponentProps) {

  const [currentList, setCurrentList] = useState<List>(list);

  useEffect(() => {
    setCurrentList(list);
  }, [list])

  const deleteItem = (item: Item) => {
    setCurrentList((prev: List) => {
       let prevList: Item[] = prev.items.indexofx;
       prevList. 
    })
  }

  return (
    <section>
      <List>
        {currentList.items.map((item, index) => (
          <ListItemComponent
            item={item}
            key={index}
            deleteItem={() => deleteItem(index)}
          />
        ))}
      </List>
    </section>
  );
}

export default ListComponent;
