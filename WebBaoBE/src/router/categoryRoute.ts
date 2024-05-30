import PromiseRouter from "express-promise-router";
import { getCategories } from "../controllers/CategoryController";

export const categoryRoute = PromiseRouter()

categoryRoute.route('/').get(getCategories)