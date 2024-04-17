import React, { useEffect, useState } from "react";
import ListItemComponent, { ListItemComponentProps } from "./ListItem";
import {  List as MuiList, ListItem } from "@mui/material";
import { Item, List} from "../model";

export type ListComponentProps = {
  list: List
  deleteItem: (index: number) => void;
};

function ListComponent({ list:{ items: [] }, deleteItem }: ListComponentProps) {

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
      <MuiList>
        {currentList.items.map((item, index) => (
          <ListItemComponent
            item={item}
            key={index}
            deleteItem={() => deleteItem(index)}
          />
        ))}
      </MuiList>
    </section>
  );
}

export default ListComponent;
