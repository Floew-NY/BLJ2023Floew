export type ListCollection = {
  lists: List[];
};
export type List = {
  name: string;
  items: Item[];
};
export type Item = {
  title: string;
  description?: string;
  dueDate: Date;
  completed: boolean;
};
