import { Request, Response } from "express";
import { getAllTags } from "../services/TagService";


export const getTags = async(req:Request, res:Response) => {
    const result = await getAllTags()
    res.status(200).json(result)
}