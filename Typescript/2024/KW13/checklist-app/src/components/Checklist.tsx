import { List } from "../model";
import ChecklistItem from "./ChecklistItem";

type ChecklistProps = {
  list: List;
  deleteItem(index: number): void;
};

function Checklist({ list: { items }, deleteItem }: ChecklistProps) {
  return items.map((item, index) =>
    item.completed ? null : (
      <ChecklistItem item={item} deleteItem={() => deleteItem(index)} />
    )
  );
}

export default Checklist;
