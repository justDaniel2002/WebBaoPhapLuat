import {
  PostFilterCategory,
  PostFilterTag,
  PostsFilterInnerTag,
  SearchPost,
  addView,
  browsePost,
  changeFavorPost,
  createPost,
  delPost,
  getFavorPost,
  getPosts,
  getPostsByAuthor,
  getPtById,
  getStatisticInformation,
  getViewByTime,
  handleExcelFileRequest,
  updatePost,
} from "../controllers/PostsController";
import multer from "multer";
import PromiseRouter from "express-promise-router";

export const postRoute = PromiseRouter();
const upload = multer({ dest: "uploads/" });

postRoute.route("/getPostByCate/:id").get(PostFilterCategory);

postRoute.route("/getPostByTag/:id").get(PostFilterTag);

postRoute.route("/getPostByInnerTag/:id").get(PostsFilterInnerTag);

postRoute.route("/search/:search").get(SearchPost);

postRoute.route("/author/:id").get(getPostsByAuthor);

postRoute.route("/browse/:id").put(browsePost);

postRoute.route("/favor/:id").get(getFavorPost)

postRoute.route("/upload").post(upload.single("file"), handleExcelFileRequest);

postRoute.route("/favor").put(changeFavorPost);

postRoute.route("/view").post(addView);

postRoute.route("/view/:time").get(getViewByTime);

postRoute.route("/static").get(getStatisticInformation);

postRoute.route("/").get(getPosts).post(createPost);

postRoute.route("/:id").get(getPtById).put(updatePost).delete(delPost);
