##Attach the instances to target group

resource "aws_alb_target_group_attachment" "tg_attachment_009" {
  count            = length(aws_instance.web_instance)
  target_group_arn = aws_lb_target_group.my-target-group-009.arn
  ##target_id         = element(split(",", join(",", aws_instance.instances.*.id)), count.index)
  target_id = aws_instance.web_instance[count.index].id
}
