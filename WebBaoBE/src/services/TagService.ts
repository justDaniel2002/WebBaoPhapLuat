import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const getAllTags = async () => {
    const tags = await prisma.tag.findMany();
    return tags
}

export const getTagById = async (id:number) => {
    const tag = await prisma.tag.findUnique({
        where:{
            tagId: id
        }
    })
    return tag
}

