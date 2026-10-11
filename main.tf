resource "google_cloudfunctions_function_iam_member" "cloudfunctions_function_iam_members" {
  for_each = var.cloudfunctions_function_iam_members

  cloud_function = each.value.cloud_function
  member         = each.value.member
  role           = each.value.role
  project        = each.value.project
  region         = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

