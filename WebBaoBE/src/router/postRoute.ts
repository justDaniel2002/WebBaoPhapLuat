import { Router } from "express";
import { getPosts, handleExcelFileRequest } from "../controllers/PostsController";
import multer from 'multer';

export const postRoute = Router()
const upload = multer({ dest: 'uploads/' });

postRoute.route("/").get(getPosts)

postRoute.route("/upload").post(upload.single('file'), handleExcelFileRequest)