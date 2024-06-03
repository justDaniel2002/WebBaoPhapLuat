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
import PostByCate from "./pages/user/PostByCate";
import PostByTag from "./pages/user/PostByTag";
import PostDetail from "./pages/user/PostDetail";
function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route path="/">
        <Route element={<MainLayout />}>
          <Route index element={<Home />} />
          <Route
            path="PostByCate/:id"
            element={<PostByCate />}
          />
          <Route
            path="PostByTag/:id"
            element={<PostByTag />}
          />
          <Route
            path="PostDetail/:id"
            element={<PostDetail />}
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
