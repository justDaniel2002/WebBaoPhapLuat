import { Request, Response } from "express";
import { getAllCategories, getCategoryById } from "../services/CategoryService";

export const getCategories = async (req:Request, res:Response) => {
    const result = await getAllCategories()
    res.status(200).json(result)
}

export const getCateById = async (req:Request, res:Response) => {
    const id = req.params.id
    const result = await getCategoryById(parseInt(id))
    res.status(200).json(result)
}

