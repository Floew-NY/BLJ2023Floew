import "./App.css";
import { AppBar, Box, Container, Grid } from "@mui/material";
import RandomCatForm from "./RandomCatForm";
import RandomCatList from "./RandomCatList";

function App() {
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
