import PromiseRouter from "express-promise-router";
import { commenting, delComment, getAllComments, getComments } from "../controllers/CommentController";

export const commentRoute = PromiseRouter()

commentRoute.route("/").get(getAllComments)

commentRoute.route("/add").post(commenting)

commentRoute.route("/:id").get(getComments).delete(delComment)

