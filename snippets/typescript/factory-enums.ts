const enum CourseCategory {
  FRONTEND,
  BACKEND,
  CLEAN_CODE,
}

export function print(courseCategory: CourseCategory) {
  switch (courseCategory) {
    case CourseCategory.BACKEND:
      console.log('Back!!')
      break
    case CourseCategory.FRONTEND:
      console.log('Front!!')
      break
    case CourseCategory.CLEAN_CODE:
      console.log('The Best!')
      break
    default:
      assertNever(courseCategory)
  }
} 

function assertNever(value: never): never {
  throw new Error('Unhandle member')
}