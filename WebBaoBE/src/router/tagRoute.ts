import PromiseRouter from "express-promise-router";
import { getInTgById, getTags, getTgById } from "../controllers/TagController";

export const tagRoute = PromiseRouter()

tagRoute.route('/innerTag/:id').get(getInTgById)

tagRoute.route('/:id').get(getTgById)

tagRoute.route('/').get(getTags)

