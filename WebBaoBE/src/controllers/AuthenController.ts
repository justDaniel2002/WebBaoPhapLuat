import { Request, Response } from "express";
import {
  banUserHandle,
  getAllUser,
  login,
  register,
} from "../services/AuthService";

export const SignUp = async (req: Request, res: Response) => {
  const { email, password } = req.body;
  console.log({ email, password });
  try {
    await register(email, password);
    res.status(200).send("sign up successfully");
  } catch (error: any) {
    res.status(500).send(error.message);
  }
};

export const SignIn = async (req: Request, res: Response) => {
  const { email, password } = req.body;

  try {
    const result = await login(email, password);
    res.status(200).json(result);
  } catch (error: any) {
    res.status(500).send(error.message);
  }
};

export const BanUser = async (req: Request, res: Response) => {
  const id = req.params.id;

  try {
    await banUserHandle(parseInt(id));
    res.status(200).send("change user status successfully");
  } catch (error: any) {
    res.status(500).send(error.message);
  }
};

export const getUser = async (req: Request, res: Response) => {
  const result = await getAllUser();
  res.status(200).json(result);
};
