power.t.test(n = 137, delta = .01, sd = .04, type = "one.sample", alt = "one.sided")$power
power.t.test(n = 137, delta = .01, sd = .04, type = "one.sample", alt = "one.sided",sig.level = .05)$power
power.t.test(n = 137, delta = .01, sd = .04, type = "one.sample", alt = "one.sided",sig.level = .05)
power.t.test(power = 0.9, delta = .01, sd = .04, type = "one.sample", alt = "one.sided")$n
power.t.test(n = 100, delta = .01, sd = .04, type = "one.sample", alt = "one.sided")$power
power.t.test(power = .9,  n = 1000, sd = 1, type = "one.sample", alt = "one.sided")$delta
power.t.test(power = .9,  n = 100, sd = 1, type = "one.sample", alt = "one.sided")$delta
power.t.test(power = .9,  n = 10, sd = 1, type = "one.sample", alt = "one.sided")$delta


# Suppose that in an AB test, one advertising scheme led to an average of
# 10 purchases per day for a sample of 100 days, while the other led to 11 purchases per day,
# also for a sample of 100 days. Assuming a common standard deviation of 4 purchases per day.
# Assuming that 10 purchases per day is a benchmark null value, that days are iid and that the
# standard deviation is 4 purchases for day. Suppose that you plan on sampling 100 days. What
# would be the power for a one sided 5% Z mean test that purchases per day have increased
# under the alternative of mu = 11 purchase per day?
power.t.test(n = 100, delta = 1, sd = 4, type = "one.sample", alt = "one.sided",sig.level = .05)$power
# also
power <- pnorm(10 + qnorm(.95) * .4, mean = 11, sd = .4, lower.tail = FALSE)


# Researchers would like to conduct a study of healthy adults to detect a four year mean brain
# volume loss of .01 mm3. Assume that the standard deviation of four year volume loss in this
# population is .04 mm3. What is necessary sample size for the study for a 5% one sided test
# versus a null hypothesis of no volume loss to achieve 80% power?
power.t.test(power = 0.8, delta = .01, sd = .04, type = "one.sample", alt = "one.sided")$n
# also
n <- (qnorm(.95) + qnorm(.8)) ^ 2 * .04 ^ 2 / .01^2
