import { PostFilterCategory, PostFilterTag, PostsFilterInnerTag, SearchPost, delPost, getPosts, getPostsByAuthor, getPtById, handleExcelFileRequest, updatePost } from "../controllers/PostsController";
import multer from 'multer';
import PromiseRouter from "express-promise-router";

export const postRoute = PromiseRouter()
const upload = multer({ dest: 'uploads/' });

postRoute.route("/getPostByCate/:id").get(PostFilterCategory)

postRoute.route("/getPostByTag/:id").get(PostFilterTag)

postRoute.route("/getPostByInnerTag/:id").get(PostsFilterInnerTag)

postRoute.route("/upload").post(upload.single('file'), handleExcelFileRequest)

postRoute.route("/search/:search").get(SearchPost)

postRoute.route("/author/:id").get(getPostsByAuthor)

postRoute.route("/").get(getPosts)

postRoute.route("/:id").get(getPtById).put(updatePost).delete(delPost)

