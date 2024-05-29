import "./index.css";
import "./App.css";
import {
  createRoutesFromElements,
  createBrowserRouter,
  Route,
  RouterProvider,
} from "react-router-dom";
import { MainLayout } from "./layouts/mainLayout";
import { Home } from "./pages/user/Home";
function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route path="/">
        <Route element={<MainLayout />}>
          <Route index element={<Home />} />
          <Route
            path="Home"
            element={<Home />}
          />
        </Route>
      </Route>
    )
  );

  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App;
