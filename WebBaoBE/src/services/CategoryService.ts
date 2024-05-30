import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const getAllCategories = async () => {
    const categories = prisma.category.findMany();
    return categories
}

