import { Request, Response } from "express";
import { getAllCategories } from "../services/CategoryService";

export const getCategories = async (req:Request, res:Response) => {
    const result = await getAllCategories()
    res.status(200).json(result)
}

