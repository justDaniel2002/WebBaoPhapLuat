import PromiseRouter from "express-promise-router";
import { getTags } from "../controllers/TagController";

export const tagRoute = PromiseRouter()

tagRoute.route('/').get(getTags)