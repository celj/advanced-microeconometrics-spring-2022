# Final

## Advanced microeconometrics

###### Instituto Tecnológico Autónomo de México

###### Carlos Lezama

### A Model of School Choice and Competition Under Social Interactions

We will analyse a model of school choice and competition under social interactions, which will be modelled as externalities in the demand side of the market.

#### Demand

We start by modelling families’ demand for schools. Each family must choose a school where to enrol a child. Preferences for schools can be represented by the following indirect utility function,

$$
U_{ijt} = \beta_{1i}p_{jt} + \beta_{2i}q_{jt} + \beta^{\prime}_{3i}X_{jt} + \beta_{4i}d_{ijt} + \beta_{5}\hat{z}^{x}_{jt} + \xi_{jt} + \varepsilon_{ijt},
$$

where the subscript $ijt$ refers to student (family) $i$ in school $j$ in market $t$. The variable $p_{jt}$ denotes the tuition (price) charged by the school. The variable $q_{jt}$ is school’s quality in the form of a value-added measure for test scores. The vector $X_{jt}$ groups other $K$ observable characteristics of the school. The variable $d_{ijt}$ denotes the distance from home to school $j$. The variable $\hat{z}^{x}_{jt}$ is student $i$’s expectation of school $j$’s average body composition in terms of the demographic variable $x$ (e.g., family income, parents’ level of education). As is usual, $\xi_{jt}$ captures school’s unobserved characteristics that are relevant for the family's decision. Finally, $\varepsilon_{ijt}$ is an idiosyncratic Type 1 Extreme Value error term.

It is important to note that $\hat{z}^x_{jt}$ is an equilibrium object in this model. Furthermore, we assume that students’ beliefs are consistent as students’ expectations lead to choices that result in schools’ equilibrium average body compositions that are consistent with them.

Note that preferences include heterogeneous coefficients. Specifically, let $\gamma_i = (\beta_{2i}, \beta_{3i}, \beta_{4i})$, and $\gamma = (\beta_2, \beta_3, \beta_4)$. We assume,

$$
\gamma_i = \gamma + \Gamma W_i,
$$

where $W_i$ is a $w \times 1$ vector of demographic variables, and $\Gamma$ is a $(K + 1) \times w$ matrix of coefficients that measure how taste varies with demographics.

Each family must choose one and only one school, but they are also allowed to choose a school outside the market. For the “outside school”, we normalise the indirect utility to be

$$
U_{i0t} \equiv \varepsilon_{i0t}.
$$

We will assume that we are working with individual-level data.

##### 1. Probability that student $i$ chooses school $j$ in the market

A.

##### 2. $\hat{z}^x_{jt}$

A.

##### 3. $U_{ijt} = \delta_{jt} + \mu_{ijt} + \varepsilon_{ijt}$

A.

##### 4. Probability that student $i$ chooses school $j$ in the market in terms of $\delta_{jt}$ and $\mu_{ijt}$

A.

##### 5. Likelihood function

A.

#### Student Achievement

An additional piece of this model is students’ counterfactual outcomes, i.e., test scores. Each student $i$ has a counterfactual test score for every school she may attend. Specifically,

$$
Y_{ijt} = A_{it} \omega + q_{jt} + \epsilon_{ijt},
$$

where $A_{it}$ is a vector of demographic characteristics of student $i$ that determine test scores, $q_{jt}$ is the value-added of school $j$, and $\epsilon_{ijt}$ is an idiosyncratic error term orthogonal to $A_{it}$ and $q_{jt}$ with zero mean and finite variance. The realised outcome for student $i$ is $\displaystyle Y_{it} = \sum_{j = 1}^J 1 \left\{ S_{it} = j \right\} Y_{ijt}$, where $S_{it} \in \{ 1, \dots, J \}$ denotes the school choice of student $i$.

##### 1. Selection on observables estimation

A.

##### 2. Selection-corrected consistent estimation

A.

#### Demand Estimation

A.

##### 1.

A.

##### 2.

A.

##### 3.

A.

##### 4.

A.

#### Supply

A.

##### 1.

A.

##### 2.

A.

##### 3.

A.

##### 4.

A.

##### 5.

A.
