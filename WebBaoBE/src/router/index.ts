
import PromiseRouter from "express-promise-router";
import { postRoute } from "./postRoute";

export const rootRoute = PromiseRouter();

rootRoute.use("/posts", postRoute)