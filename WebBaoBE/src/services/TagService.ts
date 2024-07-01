import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const getAllTags = async () => {
    const tags = await prisma.tag.findMany({
        include:{
            Post: {
                where:{
                    status: true
                }
            },
            InnerTag: true
        }
    });
    return tags
}

export const getTagById = async (id:number) => {
    const tag = await prisma.tag.findUnique({
        where:{
            tagId: id
        },
        include:{
            InnerTag:true
        }
    })
    return tag
}

export const getInnerTagById = async (id:number) => {
    const tag = await prisma.innerTag.findUnique({
        where:{
            innerTagId: id
        }
    })
    return tag
}

