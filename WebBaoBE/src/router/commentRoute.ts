import PromiseRouter from "express-promise-router";
import { commenting, delComment, getComments } from "../controllers/CommentController";

export const commentRoute = PromiseRouter()

commentRoute.route("/:id").get(getComments).delete(delComment)

commentRoute.route("/add").post(commenting)