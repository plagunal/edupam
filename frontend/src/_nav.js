export default [
  {
    component: 'CNavItem',
    name: 'Dashboard',
    to: '/dashboard',
    icon: 'cil-speedometer'
  },
  {
    component: 'CNavTitle',
    name: 'EDUPAM',
  },
  {
    component: 'CNavItem',
    name: 'Cycle',
    to: '/edupam/cycle',
    icon: 'cilLayers',
  },
  {
    component: 'CNavItem',
    name: 'Students',
    to: '/edupam/students',
    icon: 'cil-people',
  },
  {
    component: 'CNavItem',
    name: 'Attendance',
    to: '/edupam/attendance',
    icon: 'cil-people',
  },
  {
    component: 'CNavItem',
    name: 'Participations',
    to: '/edupam/participations',
    icon: 'cil-people',
  },
  {
    component: 'CNavItem',
    name: 'Homework',
    to: '/edupam/homeworks',
    icon: 'cilTask',
  },
  {
    component: 'CNavItem',
    name: 'Virtual platform',
    to: '/edupam/exercises',
    icon: 'cil-pencil',
  },
  {
    component: 'CNavItem',
    name: 'Exams',
    to: '/edupam/evaluations',
    icon: 'cil-file',
  },
  {
    component: 'CNavItem',
    name: 'OP',
    to: '/edupam/OP',
    icon: 'cilPuzzle',
  },
  {
    component: 'CNavTitle',
    name: 'Admin',
  },
  {
    component: 'CNavItem',
    name: 'Parameters',
    to: '/edupam/working',
    icon: 'cil-settings',
  },
  {
    component: 'CNavGroup',
    name: 'Base',
    to: '/base',
    icon: 'cilBookmark',
    items: [
      {
        component: 'CNavItem',
        name: 'Cycle types',
        to: '/edupam/cycle_type'
      },
      {
        component: 'CNavItem',
        name: 'Schedules',
        to: '/edupam/schedules'
      }
    ],
  },
]
