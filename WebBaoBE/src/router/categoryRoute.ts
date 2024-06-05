import PromiseRouter from "express-promise-router";
import { getCateById, getCategories } from "../controllers/CategoryController";

export const categoryRoute = PromiseRouter()

categoryRoute.route('/:id').get(getCateById)

categoryRoute.route('/').get(getCategories)

