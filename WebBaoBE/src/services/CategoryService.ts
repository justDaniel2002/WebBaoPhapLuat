import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const getAllCategories = async () => {
    const categories = await prisma.category.findMany();
    return categories
}

export const getCategoryById = async (id:number) => {
    const category = await prisma.category.findUnique({
        where:{
            categoryId: id
        }
    })
    return category
}

