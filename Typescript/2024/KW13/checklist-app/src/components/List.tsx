import React from "react";
import ListItemComponent, { ListItemComponentProps } from "./ListItem";
import { List, ListItem } from "@mui/material";
import { List } from "../model";

export type ListComponentProps = {
  list: List;
  deleteItem: (index: number) => void;
};

function ListComponent({ list, deleteItem }: ListComponentProps) {
  return (
    <section>
      <List>
        {list.items.map((item, index) => (
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
