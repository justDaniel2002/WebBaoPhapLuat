import PromiseRouter from "express-promise-router";
import { BanUser, SignIn, SignUp, getUser } from "../controllers/AuthenController";

export const authRoute = PromiseRouter()

authRoute.route("/banUser/:id").put(BanUser)

authRoute.route("/users").get(getUser)

authRoute.route("/signUp").post(SignUp)

authRoute.route("/signIn").post(SignIn)


