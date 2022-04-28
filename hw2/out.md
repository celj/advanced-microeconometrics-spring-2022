# Problem Set 2

## Advanced Microeconometrics

###### Instituto Tecnológico Autónomo de México

###### Carlos Lezama

### The Data

The following results are inspired by Rau, Sanchez, and Urzua (2019). The file `data.csv` contains real data for Chilean individuals that track their schooling and labor market decisions and outcomes from their early teens through their late twenties.

The goal is to estimate a generalized Roy model for the decision to attend a private high school in lieu of a public high school, and labor market outcomes, i.e., wages. The model includes an unobserved factor that approximates a combination of individuals’ scholastic abilities.

The following is a description of the variables in the data:

- `test_X` is students' performance on standardized test `X`. The unit measure is standard deviations.
- `privateHS` is a dummy indicating having attended a private high school.
- `wage` is the natural log of wage.
- `male`, `momschoolingX`, `dadschoolingX`, `broken_homeX`, `incomehhX`, `north`, `center` are demographic variables.
- `share_private` and `avg_price` are instruments for the decision of attending a private high school, and denote the local share of private high schools and the average fees local private high schools charge.

### The Model

Formally, the model includes potential outcomes as follows,

$$
\begin{align*}
Y_1 &= X\beta_1 + \theta\alpha_1 + U_1, \\
Y_0 &= X\beta_0 + \theta\alpha_0 + U_0,
\end{align*}
$$

where $Y_1$ is the potential outcome (i.e., `wages`) in the counterfactual of attending a private high school, and $Y_0$ is similarly defined for the counterfactual of attending a public high school. All relevant observable demographics are included in $X$, while $\theta$ is the unobserved one-dimensional factor (i.e., ability) determining labour market outcomes. The unobserved factor is normally distributed with mean zero and standard deviation $\sigma_\theta$. The terms $U_1$ and $U_0$ are idiosyncratic error terms that are normally distributed with mean zero and standard deviations $\sigma_1$ and $\sigma_2$, respectively.

Individual decide wheter or not to attend a private high school based on a latent variable $I$:

$$
I = Z\gamma + \theta\alpha_I + V,
$$

where $Z$ include observable demographics and instruments, and $V$ is an idiosyncratic error term with mean zero and unit variance. Note that the unobservable factor is also present in this part of the model. We can thus define a binary variable $D$ indicating treatment status,

$$
D = 1[I \geq 0].
$$

The model includes a measurement system, that help with the identification of the distribution of $\theta$. Specifically,

$$
T_k = W\omega_k + \theta\alpha_{T_k} + \varepsilon_k, \quad \forall k = 1, 2, 3, 4,
$$

where $T_k$ is the test score $k$, $W$ include demographics determining test scores, and $\varepsilon_k$ normally distributed error term with mean zero and standard deviation $\sigma_{\varepsilon_k}$.

Finally, we assume that the error terms in the model are all independent from each other conditioning on the observables and the unobserved factor, i.e., $U_1 \perp\!\!\!\perp U_0 \perp\!\!\!\perp V \perp\!\!\!\perp \varepsilon \mid X, Z, W, \theta$, and $\theta$ is independent of all observables.

For the empirical implementation of the model, in $X$ include `male`, `north`, and `center`. In $Z$ include all variables in $X$ plus `share_private` and `avg_price`. In $W$ include `male`, `momschoolingX`, `dadschoolingX`, `broken_homeX`, `incomehhX`, `north`, and `center`. The outcome variable is `wage`. $D$ is `privateHS`. And, the measurement system is comprised by the four test scores `test_X`.

### 1

As stated in Heckman, et al. (2003), we may have

$$
T_k = \theta\alpha_{T_k} + \varepsilon_k, \quad \forall k = 1, 2, 3, 4,
$$

such that $\text{Cov}(T_i, T_j) = \alpha_{T_i}\alpha_{T_j}\sigma^2_\theta$ for any $i \neq j$. This way, we can obtain the values for the rest of the loadings in the measuring system such that

$$
\frac{T_k}{\alpha_{T_k}} = \theta + \varepsilon^*_{T_k}, \quad \forall k = 1, 2, 3, 4,
$$

where $\varepsilon^*_{T_k} = \varepsilon_{T_k} / \alpha_{T_k}$. Thus, we can compute the densities of every $\varepsilon_{T_k}$, and $\theta$. The assumption that one of the loadings in the measuring system is equal to one is necessary in order to compute the other ones; otherwise, we may have $n$ equations and $n + 1$ unknowns.

### 2

### 3

### 4

### 5

### 6

### 7

### 8

### 9

### 10

### 11

### 12