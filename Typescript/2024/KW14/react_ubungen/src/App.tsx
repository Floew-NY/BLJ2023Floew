import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import { AppBar, Box, Container, Grid } from "@mui/material";
import RandomCatForm from "./RandomCatForm";
import RandomCatList from "./RandomCatList";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Box>
        <Container>
          <AppBar></AppBar>
          <Grid container>
            <RandomCatForm />
          </Grid>
          <Grid container>
            <RandomCatList />
          </Grid>
        </Container>
      </Box>
    </>
  );
}

export default App;
