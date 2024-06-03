import { Request, Response } from "express";
import { getAllTags, getTagById } from "../services/TagService";


export const getTags = async(req:Request, res:Response) => {
    const result = await getAllTags()
    res.status(200).json(result)
}

export const getTgById = async (req:Request, res:Response) => {
    const id = req.params.id
    const result = await getTagById(parseInt(id))
    res.status(200).json(result)
}