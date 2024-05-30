
import PromiseRouter from "express-promise-router";
import { postRoute } from "./postRoute";
import { categoryRoute } from "./categoryRoute";
import { tagRoute } from "./tagRoute";
import { authRoute } from "./authRoute";

export const rootRoute = PromiseRouter();

rootRoute.use("/posts", postRoute)

rootRoute.use("/categories", categoryRoute)

rootRoute.use("/tags", tagRoute)

rootRoute.use("/auth", authRoute)