import { PostFilterCategory, PostFilterTag, addPostTag, delPost, getPosts, handleExcelFileRequest, updatePost } from "../controllers/PostsController";
import multer from 'multer';
import PromiseRouter from "express-promise-router";

export const postRoute = PromiseRouter()
const upload = multer({ dest: 'uploads/' });

postRoute.route("/").get(getPosts)

postRoute.route("/:id").put(updatePost).delete(delPost)

postRoute.route("/getPostByCate/:id").get(PostFilterCategory)

postRoute.route("/getPostByTag/:id").get(PostFilterTag)

postRoute.route("/addTag/:id").post(addPostTag)

postRoute.route("/upload").post(upload.single('file'), handleExcelFileRequest)