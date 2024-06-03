import PromiseRouter from "express-promise-router";
import { getTags, getTgById } from "../controllers/TagController";

export const tagRoute = PromiseRouter()

tagRoute.route('/').get(getTags)

tagRoute.route('/:id').get(getTgById)