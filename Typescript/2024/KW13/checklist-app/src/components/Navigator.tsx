import { useState } from "react";
import { ListCollection } from "../model";
import {
  Button,
  Chip,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  TextField,
} from "@mui/material";

type NavigatorProps = {
  listCollection: ListCollection;
  active: number;
  setActive(active: number): void;
  createList(name: string): void;
};

function Navigator({
  listCollection: { lists },
  active,
  setActive,
  createList,
}: NavigatorProps) {
  const [openDialog, setOpenDialog] = useState(false);
  const [listName, setListName] = useState("");
  const handleClickOpen = () => {
    setOpenDialog(true);
  };
  const handleClose = () => {
    setOpenDialog(false);
  };
  const handleSave = () => {
    createList(listName);
    setListName("");
    handleClose();
  };
  return (
    <div className="flex space-x-1">
      {lists.map((list, index) => (
        <>
          {index === active ? (
            <Chip label={list.name} variant="filled" onClick={() => null} />
          ) : (
            <Chip
              label={list.name}
              variant="outlined"
              onClick={() => setActive(index)}
            />
          )}
        </>
      ))}
      <Chip label="+" variant="outlined" onClick={handleClickOpen} />
      <Dialog open={openDialog} onClose={handleClose}>
        <DialogTitle>Set List Name</DialogTitle>
        <DialogContent>
          <DialogContentText>
            Please enter a name for your new checklist.
          </DialogContentText>
          <TextField
            autoFocus
            margin="dense"
            id="name"
            label="List Name"
            type="text"
            fullWidth
            variant="standard"
            value={listName}
            onChange={(event) => setListName(event.target.value)}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={handleSave}>Create</Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default Navigator;
