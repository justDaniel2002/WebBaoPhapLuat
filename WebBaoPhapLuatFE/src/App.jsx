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
import { Login } from "./pages/auth/Login";
import Register from "./pages/auth/Register";
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { AdminLayout } from "./layouts/adminLayout";
import AdminPage from "./pages/admin/AdminPage";
import SearchPosts from "./pages/user/SearchPosts";
import AddPostPage from "./pages/admin/AddPostPage";
import CreatedPostPage from "./pages/admin/CreatedPage";
import EditPostPage from "./pages/admin/EditPostPage";
function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route path="/">
        <Route path="auth">
          <Route path="login" element={<Login />} />
          <Route path="register" element={<Register />} />
        </Route>

        <Route element={<AdminLayout />}>
          <Route path="Admin" element={<AdminPage />} />
          <Route path="createPost" element={<AddPostPage />} />
          <Route path="createdPost" element={<CreatedPostPage />} />
          <Route path="createdPost/EditPost/:id" element={<EditPostPage />} />
        </Route>

        <Route element={<MainLayout />}>
          <Route index element={<Home />} />
          <Route path="PostByCate/:id" element={<PostByCate />} />
          <Route path="PostByTag/:id" element={<PostByTag />} />
          <Route path="PostDetail/:id" element={<PostDetail />} />
          <Route path="SearchPosts/:search" element={<SearchPosts />} />
        </Route>
      </Route>
    )
  );

  return (
    <>
      <RouterProvider router={router} />
      <ToastContainer />
    </>
  );
}

export default App;
