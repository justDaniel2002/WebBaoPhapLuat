import PromiseRouter from "express-promise-router";
import { SignIn, SignUp } from "../controllers/AuthenController";

export const authRoute = PromiseRouter()

authRoute.route("/signUp").post(SignUp)

authRoute.route("/signIn").post(SignIn)