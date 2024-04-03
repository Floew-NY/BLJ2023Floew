import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  IconButton,
  TextField,
} from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import { useState } from "react";
import { Padding } from "@mui/icons-material";
import { Item } from "../model";

type AddListButtonProps = {
  addList(item: Item): void;
};
function AddListButton({ addList }: AddListButtonProps) {
  const [openDialog, setOpenDialog] = useState(false);
  const [item, setItem] = useState<Item>({
    title: "",
    completed: false,
    dueDate: new Date(),
  });

  const handleClose = () => {
    setOpenDialog(false);
  };
  const handleSave = () => {
    addList(item);
    setItem({ title: "", completed: false, dueDate: new Date() });
    setOpenDialog(false);
  };
  return (
    <>
      <Button onClick={() => setOpenDialog(!openDialog)} sx={{ padding: 0 }}>
        <div className="border border-solid border-gray-200 rounded-md py-2 w-full">
          <AddIcon />
        </div>
      </Button>
      <Dialog open={openDialog}>
        <DialogTitle>Set List Name</DialogTitle>
        <DialogContent>
          <DialogContentText>
            Please Fill out for your New Todo.
          </DialogContentText>
          <TextField
            autoFocus
            required
            margin="dense"
            id="title"
            label="Todo Title"
            type="text"
            fullWidth
            value={item.title}
            onChange={(e) => setItem({ ...item, title: e.target.value })}
          />
          <TextField
            margin="dense"
            id="description"
            label="Description"
            type="text"
            fullWidth
            value={item.description}
            onChange={(e) => setItem({ ...item, description: e.target.value })}
          />
          <TextField
            margin="dense"
            required
            id="due-date"
            label="Due Date"
            type="date"
            fullWidth
            value={item.dueDate.toISOString().split("T")[0]}
            onChange={(e) =>
              setItem({ ...item, dueDate: new Date(e.target.value) })
            }
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={handleSave}>Save</Button>
        </DialogActions>
      </Dialog>
    </>
  );
}

export default AddListButton;
