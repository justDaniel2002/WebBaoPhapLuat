import PromiseRouter from "express-promise-router";
import { commenting, delComment, getComments } from "../controllers/CommentController";

export const commentRoute = PromiseRouter()

commentRoute.route("/add").post(commenting)

commentRoute.route("/:id").get(getComments).delete(delComment)

