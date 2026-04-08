using RelationShips.Models;

namespace RelationShips.Repostories
{
    public interface IStudentRepository
    {
        List<Student> GetStudentsWithCourse();
        List<Course> GetCoursesWithStudents();
    }
}