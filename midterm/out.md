# Midterm

## Advanced microeconometrics

###### Instituto Tecnológico Autónomo de México

###### Carlos Lezama

### MTE, Treatment Effects Parameters, and Weights

In the framework of Heckman and Vytlacil (1999, 2005, 2007), and Heckman, Urzua, and Vytlacil (2006):

1. Show that any discrete choice model, $I = \eta(Z) - V$, may be written in equivalent form as,

$$
I \geq 0 \iff \eta(Z) > V
$$

or,

$$
P(Z) > U_D,
$$

where $P(Z) = F_V(\eta(Z))$, $U_D = F_V(V)$, $F_V$ is the cdf of $V$ (assumed strictly increasing), and $U_D$ is uniformly distributed.

Given our choice model, we know that

$$
\begin{align*}
D &= 1[I \geq 0] \\
&= 1[\eta(Z) \geq V].
\end{align*}
$$

Since $F_V$ is strictly increasing, we can rewrite

$$
\begin{align*}
D &= 1[F_V(\eta(Z)) \geq F_V(V)] \\
&= 1[P(Z) \geq U_D].
\end{align*}
$$

2. Define the Marginal Treatment Effect ($MTE(X = x, U_D = u_D)$).

Let $\Delta = Y_1 - Y_0$.

$$
MTE(X = x, U_D = u_D) = E(\Delta \mid X = x, U_D = u_D).
$$

Namely, the expected effect of treatment conditional on observed characteristics and unobservables.

3. Define the LIV (Local Instrumental Variables) estimator. Assume $Z$ is continuous conditional on $X$ (variables in outcome equations). Show that LIV identifies the MTE if the $Z$ are continuous.

We define the LIV as follows:

$$
LIV(x, p) = \frac{\part E(Y \mid X = x, P(Z) = p)}{\part p}.
$$

Given our initial assumptions, we can write $E(Y \mid Z = z) = E(Y \mid P(Z) = p)$.

Thus,

$$
\begin{align*}
E(Y \mid P(Z) = p) &= E(DY_1 + (1 - D)Y_0 \mid P(Z) = p) \\
&= E(Y_0) + E(D \Delta \mid P(Z) = p).
\end{align*}
$$

Note that

$$
\begin{align*}
E(D \Delta \mid D) &= 1 \times \Delta \times \text{Pr}(D = 1) + 0 \times \Delta \times \text{Pr}(D = 0) \\
&= p \times \Delta \\
&= E(\Delta \mid D = 1),
\end{align*}
$$

such that

$$
\begin{align*}
E(E(\Delta \mid D = 1) \mid P(Z) = p) &= E(\Delta \mid D = 1)p \\
&= E(E(\Delta \mid P(Z) = p) \mid D = 1).
\end{align*}
$$

This way,

$$
\begin{align*}
E(Y \mid P(Z) = p) &= E(Y_0) + E(\Delta \mid D = 1)p \\
&= E(Y_0) + E(\Delta \mid P(Z)= p \geq U_D)p \\
&= E(Y_0) + \frac{1}{p} \left( \int_0^p \Delta \times f_{U_D} (\Delta) du_D \right) p \\
&= E(Y_0) + \int_0^p \Delta \times f_{U_D} (\Delta) du_D \\
&= E(Y_0) + \int_0^p E(\Delta \mid U_D = u_D)du_D.
\end{align*}
$$

As a consequence,

$$
\left. \frac{\part}{\part p} E(Y \mid P(Z) = p) \right|_{P(z) = p} = E(\Delta \mid U_D = p).
$$

4. Now, suppose that the $Z$ are discrete instruments (i.e. are discrete valued variables). What does IV identify?

In the discrete case, the IV estimates are LATE-weighted averages so that we can observe marginal effects related to the other instruments.

5. Prove that,

$$
\begin{align*}
ATE(x) &= \int_0^1 MTE(x, u_D)du_D, \\
TUT(x) &= \int_0^1 MTE(x, u_D) \omega^{TUT} du_D,
\end{align*}
$$

where $\omega^{TUT}(u_D) \geq 0$ for all $u_D$ in $[0, 1]$, and $\displaystyle \int_0^1 \omega^{TUT}(u_D) du_D = 1$. Derive the expression for $\omega^{TUT}$.

Clearly, 

$$
\begin{align*}
ATE(x) &= E(\Delta \mid X = x) \\
&= \int_0^1 E(\Delta \mid X = x, U_D = u_D)du_D \\
&= \int_0^1 MTE(x, u_D) du_D.
\end{align*}
$$

Furthermore, we know that

$$
(1 - P(z)) TUT(x, P(z)) = \int_0^1 E(\Delta \mid X = x, U_D = u_D) du_D.
$$

Hence,

$$
\begin{align*}
TUT(x) &= \int_0^1 \left[ \int_p^1 E(\Delta \mid X = x, U_D = u_D) du_D \right] dF_{P(Z) \mid X, D} (p \mid x, 0) \\
&= \frac{1}{1 - p} \int_0^1 \int_0^p E(\Delta \mid X = x, U_D = u_D) du_D dF_{1 - P(Z) \mid X, D} (p \mid x, 0) \\
&= \frac{1}{1 - p} \int_0^1 \int_0^1 1(u_D \leq 1 - p) E(\Delta \mid X = x, U_D = u_D) du_D dF_{1 - P(Z) \mid X} (p \mid x) \\
&= \frac{1}{\int F_{1 - P(Z) \mid X} (u_D) dt} \int_0^1 \int_0^1 1(p \leq 1 - u_D) E(\Delta \mid X = x, U_D = u_D) dF_{1 - P(Z) \mid X} (p \mid x) du_D \\
&= \int_0^1 E(\Delta \mid X = x, U_D = u_D) \left[ \frac{F_{1-P(Z) \mid X} (u_D)}{\int F_{1 - P(Z) \mid X} (u_D) dt} \right] du_D \\
&= \int_0^1 MTE(x, u_D) \omega^{TUT} (u_D) du_D.
\end{align*}
$$

Moreover, using Bayes’ rule, we get

$$
\begin{align*}
\omega^{TUT} (u_D) &= \frac{F_{1-P(Z) \mid X} (u_D)}{\int F_{1 - P(Z) \mid X} (u_D) dt} \\
&= \frac{\text{Pr}(P(Z) \leq 1 - u_D \mid X = x)}{E(1 - P(Z) \mid X = x)} \\
&= \left[ \int_0^{u_D} f(p \mid X = x)dp \right] \frac{1}{E(1 - P(Z) \mid X = x)}.
\end{align*}
$$

6. Define and derive the Policy Relevant Treatment Effect in terms of the MTE and compare it to the ATE.

Let $a$ and $a'$ be two potential policies such that we can identify decisions and potential outcomes with them as subscripts. We define the policy relevant treatment effect as the solution to a Benthamite policy criterion for policies operating on decisions to participate.

Thereby, let $V(Y) = Y$.

Hence,

$$
\begin{align*}
PRTE(x) &= E(Y_a \mid X = x) - E(Y_{a'} \mid X = x) \\
&= \int_0^1 E(\Delta \mid X = x, U_D = u_D) \left[ F_{a' \mid X} (u_D \mid x) - F_{a \mid X} (u_D \mid x) \right] du_D \\
&= \int_0^1 MTE(x, u_D) \left[ F_{a' \mid X} (u_D \mid x) - F_{a \mid X} (u_D \mid x) \right] du_D.
\end{align*}
$$

Clearly, this behaves like a neighborhood around the ATE, as might be intuitively expected under two alternative policy proposals.

7. Derive the IV weights for $IV(Z_1)$, where the vector of instruments is $Z = (Z_1, \dots, Z_k)$, $k \geq 2$, and $Z_1$ is continuously distributed.

Let $\tilde{Z}_1 \equiv Z_1 - E(Z_1 \mid X = x)$. Then

$$
\begin{align*}
Cov(Z_1, Y \mid X = x) &= E(\tilde{Z}_1 \times 1(u_D \leq P(Z)) \times \Delta \mid X = x) \\
&= E( \tilde{Z}_1 \times 1(U_D \leq P(Z)) \times E(\Delta \mid X = x, Z, U_D) \mid X = x) \\
&= E( \tilde{Z}_1 \times 1(U_D \leq P(Z)) \times E(\Delta \mid X = x, U_D) \mid X = x) \\
&= E( E(\tilde{Z}_1 \times 1(U_D \leq P(Z)) \mid X = x, U_D) \times E(\Delta \mid X = x, U_D) \mid X = x ) \\
&= \int \left[ E(\tilde{Z}_1 \mid X = x, P(Z) \geq u_D) \times \text{Pr} (P(Z) \geq u_D \mid X = x) \times E(\Delta \mid X = x, U_D = u_d) \right] du_D \\
&= \int \left[ MTE(x, u_D) \times E(\tilde{Z}_1 \mid X = x, P(Z) \geq u_D) \times \text{Pr} (P(Z) \geq u_D \mid X = x) \right] du_D.
\end{align*}
$$

In general, we know that the population analog of the IV estimator is given by

$$
IV_J (x) = \int_0^1 MTE(x, u_D) \omega_{IV}^J (x, u_D) du_D
$$

for any given instrument $J$.

In this case, let $J = Z_1$ such that

$$
\omega_{IV}^{Z_1} = \frac{E(\tilde{Z}_1 \mid X = x, P(Z) \geq u_D) \text{Pr} (P(Z) \geq u_d \mid X = x)}{Cov(Z_1, P(Z) \mid X = x)}.
$$

Observe that by iterated expectations

$$
Cov(Z_1, P(Z) \mid X = x) = Cov(Z_1, D \mid X = x).
$$

### Semiparametric Estimation of the MTE

Consider the following model:

$$
\begin{align*}
Y_1 &= \alpha_0 + \varphi + U_1, \\
Y_0 &= \alpha_0 + U_0,
\end{align*}
$$

where $U_0$ and $U_1$ represent the unobservables in the potential outcome equations, and $\varphi$ represents the benefit associated with the treatment ($D = 1$). Individuals decide whether or not to receive the treatment ($D = 1$ or $D = 0$) based on a latent variable $I$:

$$
I = Z\gamma - V,
$$

where $Z$ and $V$ represent observables and unobservables, respectively. Thus, we can define a binary variable $D$ indicating treatment status,

$$
D = 1 [I \geq 0].
$$

Finally, we assume that the error terms in the model are not independent even conditioning on the observables, i.e. $U_1 \not\perp\!\!\!\!\!\!\!\perp U_0 \not\perp\!\!\!\!\!\!\!\perp V \mid Z$, but $(U_1, U_0, V) \perp\!\!\!\!\perp Z$.

1. Show that,

$$
E(Y \mid P(Z) = p) = \alpha_0 + K(p),
$$

where $Y = DY_1 + (1 - D)Y_0$, $P(Z)$ is the propensity score or probability of selection, $p$ is a particular evaluation of the propensity score, and

$$
K(p) = \varphi p + E(U_0 \mid P(Z) = p) + E(U_1 - U_0 \mid D = 1, P(Z) = p)\ p.
$$

$$
\begin{align*}
E(Y \mid P(Z) = p) &= E(DY_1 + (1 - D)Y_0 \mid P(Z) = p) \\
&= E(Y_0 \mid P(Z) = p) + E(Y_1 - Y_0 \mid P(Z) = p) \\
&= E(Y_0 \mid P(Z) = p) + E(Y_1 - Y_0 \mid D = 1, P(Z) = p)\ p \\
&= E(a_0 + U_0 \mid P(Z) = p) + E(\alpha_0 + \varphi + U_1 - \alpha_0 - U_0 \mid D = 1, P(Z) = p)\ p \\
&= \alpha_0 + E(U_0 \mid P(Z) = p) + \varphi p + E(U_1 - U_0 \mid D = 1, P(Z) = p)\ p \\
&= \alpha_0 + K(p).
\end{align*}
$$

2. Use these two expressions to explain the steps involved in the semiparametric estimation of the Marginal Treatment Effect as presented in Heckman, Urzua, and Vytlacil (2006).

Note that there is no $\{\beta_0, \beta_1\}$ to estimate. Then, it is pretty straightforward to observe that

$$
\left. \frac{\part E(Y \mid X = x, P(Z) = p)}{\part p} \right|_{p = u_D} = \left. \frac{\part K(p)}{\part p} \right|_{p = u_D}.
$$

Therefore, we only need to estimate $\displaystyle \frac{\part K(p)}{\part p}$.

First, let $\tilde{Y} = K(\hat{P}(Z)) + \tilde{v}$. This way, we can assume $E(\tilde{v} \mid \hat{P}(Z), X) = 0$.

Let $\vartheta_1(p)$ denote the nonparametric estimator of $\part K(p) / \part p$. Note that we now use a subset of values of $\hat{P}(z)$ to define the points $p$ on which our estimator is evaluated. We use the set $\mathscr{P}$ to define this set of evaluation points that contains the values of $\hat{P}(z)$ for which we obtain positive frequencies in both the $D = 0$ and $D = 1$ samples.

Thus, $\vartheta_1(p)$ is computed as

$$
\left\{ \vartheta_0(p), \vartheta_1(p) \right\} = {\arg\!\min}_{\left\{ \vartheta_0(p), \vartheta_1(p) \right\}} \sum_{j = 1}^N \left\{ \tilde{Y}(j) - \vartheta_0 - \vartheta_1(\hat{P}(z(j)) - p)^2 \times \Psi\left(\frac{\hat{P}(z(j)) - p}{h}\right) \right\}
$$

where $\Psi(\cdot)$ and $h$ represent the kernel function and the bandwidth, respectively.

Finally, the LIV estimator of the MTE is computed as

$$
LIV(x, u_D) = \left. \widehat{\frac{\part K(p)}{\part p}} \right|_{p = u_D} = \widehat{MTE}(x, u_D), \quad \forall p \in \mathscr{P}.
$$

3. Explain in detail why you can approximate $K(p)$ with a polynomial on $p$. Explain how you can estimate the Marginal Treatment Effect using this approximation.

Since $K(p)$ is differentiable on $p$, we can approximate a polynomial using Taylor series such that $k(p_0) = K(p_0) + K'(p_0)(p - p_0)$. In this manner, we can approximate by fitting many linear polynomials on multiple intervals. Similar to stump regression that finds the best step directions locally, as done on gradient boosting machines.
