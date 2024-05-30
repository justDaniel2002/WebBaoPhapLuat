import { Request, Response } from "express";
import { login, register } from "../services/AuthService";


export const SignUp = async (req:Request, res:Response) => {
    const {email, password} = req.body

    try {
        await register(email, password)
        res.status(200).send("sign up successfully")
    } catch (error:any) {
        res.status(500).send(error.message)
    }
}


export const SignIn = async (req:Request, res:Response) => {
    const {email, password} = req.body

    try {
        const result = await login(email, password)
        res.status(200).json(result)
    } catch (error:any) {
        res.status(500).send(error.message)
    }
}