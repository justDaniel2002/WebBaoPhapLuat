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
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { AdminLayout } from "./layouts/adminLayout";
import AdminPage from "./pages/admin/AdminPage";
import SearchPosts from "./pages/user/SearchPosts";
import AddPostPage from "./pages/admin/AddPostPage";
import CreatedPostPage from "./pages/admin/CreatedPage";
import EditPostPage from "./pages/admin/EditPostPage";
import PostByInnerTag from "./pages/user/PostByInnerTag";
import { motion } from "framer-motion";
import { ModalStackContainer } from "rc-modal-sheet";
import "rc-modal-sheet/dist/index.css"
import AddOnePostPage from "./pages/admin/AddOnePostPage";
import FavorPost from "./pages/user/FavorPost";
import UserManager from "./pages/admin/UserManager";
import CommentManager from "./pages/admin/CommentManager";

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
          <Route path="userManager" element={<UserManager />} />
          <Route path="createOnePost" element={<AddOnePostPage />} />
          <Route path="createdPost" element={<CreatedPostPage />} />
          <Route path="commentManager" element={<CommentManager />} />
          <Route path="createdPost/EditPost/:id" element={<EditPostPage />} />
        </Route>

        <Route element={<MainLayout />}>
          <Route index element={<Home />} />
          <Route path="PostByCate/:id" element={<PostByCate />} />
          <Route path="PostByTag/:id" element={<PostByTag />} />
          <Route path="PostByInnerTag/:id" element={<PostByInnerTag />} />
          <Route path="PostDetail/:id" element={<PostDetail />} />
          <Route path="SearchPosts/:search" element={<SearchPosts />} />
          <Route path="FavorPosts" element={<FavorPost />} />
        </Route>
      </Route>
    )
  );

  return (
    <>
      <ModalStackContainer m={motion}>
        {" "}
        <RouterProvider router={router} />
        <ToastContainer />
      </ModalStackContainer>
    </>
  );
}

export default App;
