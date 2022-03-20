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

2. Define the Marginal Treatment Effect ($MTE(X = x, U_D = u_D)$).
2. Define the LIV (Local Instrumental Variables) estimator. Assume $Z$ is continuous conditional on $X$ (variables in outcome equations). Show that LIV identifies the MTE if the $Z$ are continuous.
2. Now, suppose that the $Z$ are discrete instruments (i.e. are discrete valued variables). What does IV identify?
2. Prove that,

$$
\begin{align*}
ATE(X) &= \int_0^1 MTE(X, u_D)du_D, \\
TUT(X) &= \int_0^1 MTE(X, u_D) \omega^{TUT} du_D,
\end{align*}
$$

where $\omega^{TUT}(u_D) \geq 0$ for all $u_D$ in $[0, 1]$, and $\displaystyle \int_0^1 \omega^{TUT}(u_D) du_D = 1$. Derive the expression for $\omega^{TUT}$.

6. Define and derive the Policy Relevant Treatment Effect in terms of the MTE and compare it to the ATE.
7. Derive the IV weights for $IV(Z_1)$, where the vector of instruments is $Z = (Z_1, \dots, Z_k)$, $k \geq 2$, and $Z_1$ is continuously distributed.

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
D = \mathbb{1} [I \geq 0].
$$
Finally, we assume that the error terms in the model are not independent even conditioning on the observables, i.e. $U_1 \not\ind U_0 \not\ind V \mid Z$, but $(U_1, U_0, V) \ind Z$.

1. Show that,

$$
E(Y \mid P(Z) = p) = \alpha + K(p),
$$

where $Y = DY_1 + (1 - D)Y_0$, $P(Z)$ is the propensity score or probability of selection, $p$ is a particular evaluation of the propensity score, and
$$
K(p) = \varphi p + E(U_0 \mid P(Z) = p) + E(U_1 - U_0 \mid D = 1, P(Z) = p)p.
$$

2. Use these two expressions to explain the steps involved in the semiparametric estimation of the Marginal Treatment Effect as presented in Heckman, Urzua, and Vytlacil (2006).
3. Explain in detail why you can approximate $K(p)$ with a polynomial on $p$. Explain how you can estimate the Marginal Treatment Effect using this approximation.
