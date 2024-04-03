import {
  ButtonBase,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  ListItem,
  ListItemButton,
  ListItemText,
  Typography,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";

import { Item } from "../model";
import { DoneRounded } from "@mui/icons-material";
import { useState } from "react";

type ChecklistItemProps = {
  item: Item;
  deleteItem(): void;
};

function ChecklistItem({
  item: { title, description },
  deleteItem,
}: ChecklistItemProps) {
  const [openDialog, setOpenDialog] = useState(false);

  const handleClickOpen = () => {
    setOpenDialog(true);
  };
  const handleClose = () => {
    setOpenDialog(false);
  };
  return (
    <div className="border border-solid border-gray-200 rounded-md my-2">
      <ListItem
        sx={{ padding: 0 }}
        secondaryAction={
          <ListItemButton
            className="border border-solid border-gray-300 rounded-md p-0"
            onClick={deleteItem}
          >
            <DoneRounded />
          </ListItemButton>
        }
      >
        <ListItemButton className="p-0" onClick={handleClickOpen}>
          <ListItemText primary={title} />
        </ListItemButton>
      </ListItem>
      <Dialog
        onClose={handleClose}
        aria-labelledby="customized-dialog-title"
        open={openDialog}
        className=""
      >
        <DialogTitle sx={{ m: 0, p: 2 }} id="customized-dialog-title">
          {title}
        </DialogTitle>
        <IconButton
          aria-label="close"
          onClick={handleClose}
          sx={{
            position: "absolute",
            right: 8,
            top: 8,
            color: (theme) => theme.palette.grey[500],
          }}
        >
          <CloseIcon />
        </IconButton>
        {description && (
          <DialogContent dividers>
            <Typography gutterBottom>{description}</Typography>
          </DialogContent>
        )}
        <DialogActions>
          <ButtonBase autoFocus onClick={handleClose}>
            Save changes
          </ButtonBase>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default ChecklistItem;
