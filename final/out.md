# Final

## Advanced microeconometrics

###### Instituto Tecnológico Autónomo de México

###### Carlos Lezama

### A Model of School Choice and Competition Under Social Interactions

We will analyse a model of school choice and competition under social interactions, which will be modelled as externalities in the demand side of the market.

#### Demand

We start by modelling families’ demand for schools. Each family must choose a school where to enrol a child. Preferences for schools can be represented by the following indirect utility function,

$$
U_{ijt} = \beta_{1i}p_{jt} + \beta_{2}q_{jt} + \beta^{\prime}_{3i}X_{jt} + \beta_{4i}d_{ijt} + \beta_{5}\hat{z}^{x}_{jt} + \xi_{jt} + \varepsilon_{ijt},
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
U_{i0t} \equiv \varepsilon_{i0t}
$$

We will assume that we are working with individual-level data.

##### 1. Probability that student $i$ chooses school $j$ in the market

Following Allende (2019), the family (student) will choose school $j$ to maximize $U_{ijt}$ in their choice set $\Omega_{it}$. Each market is characterised by a set of nodes, $N_m$, and school, $N_s$, where $w^m_{nk}$ is the distribution of students of type $k$ across nodes and $\pi_k^m$ is the proportion of the students in the market who are of type $k$. By our error term assumption, we can calculate the probability that a family of observable type $k$, who lives at node $n$ and has unobservable type $v_i$ will select school $j$ as follows:

$$
s^{nk}_{ijt} = \frac{\exp(U_{ijt}(\mu, p, \hat{z}^x))}{\displaystyle \sum_{l \in \Omega_{it}} \exp(U_{ilt}(\mu, p, \hat{z}^x))} \label{indprob}
$$

By integrating these probabilities over $i$ we will obtain the share of families type $k$ who live at node $n$ at time $t$ who will select school $j$. We can obtain the shares of each school at the market level, taking the sum of probability that a family of type $k$ will select school $j$ across nodes and both observable and unobservable types, $N_v$, which have weights $w^v$.

$$
s^k_{jt}(\mu, p, \hat{z}^x) = \sum_{n}^{N_m} s^{nk}_{jt} \cdot w^m_{nk} \label{prob1}
$$

$$
s_{jt}(\mu, p, \hat{z}^x) = \sum_k^K \sum_{n}^{N_m} s^{nk}_{jt} \cdot w^m_{nk} \cdot \pi^m_k \label{share}
$$

Where $\ref{prob1}$ is the market shares of the school $j$ for each type $k$ (probability of family type $k$ chooses school $j$) and $\ref{share}$ is the share for the total market. Also,

$$
s^{nk}_{jt} = \sum_{i = 1}^{N_v} s^{nk}_{ijt} \cdot w^v
$$

Note that, rewriting $\ref{indprob}$, our target probability can be expressed as follows:

$$
s_{ikt} = \frac{\exp(\beta_{1i}p_{kt} + \beta_{2i}q_{kt} + \beta^{\prime}_{3i}X_{kt} + \beta_{4i}d_{ikt} + \beta_{5}\hat{z}^{x}_{kt} + \xi_{kt})}{\displaystyle \sum_j \exp(\beta_{1i}p_{jt} + \beta_{2i}q_{jt} + \beta^{\prime}_{3i}X_{jt} + \beta_{4i}d_{ijt} + \beta_{5}\hat{z}^{x}_{jt} + \xi_{jt})}
$$

##### 2. $\hat{z}^x_{jt}$

Note that $z^x$  is a vector that contain the fixed points that satisfy the following system of equations:

$$
\hat{z}^x_{jt} = \mathcal{Z}^x_{jt} (\mu, p, z^x) = \frac{\displaystyle N \times \pi_{k=x}^m \times \sum_n^{N_m} \sum_i^{N_v} \mathcal{S}_{ijt}^{n, k = x} (\mu, p, z^x) \times w^v \times w^m_{n, k = x}}{\displaystyle N \times \sum_k^K \sum_n^{N_m} \sum_i^{N_v} \mathcal{S}_{ijt}^{n, k} (\mu, p, z^x) \times w^v \times w^m_{n k} \times \pi_{k}^m},
$$

for $j = \{1, \dots, N_j^m\}$.

##### 3. $U_{ijt} = \delta_{jt} + \mu_{ijt} + \varepsilon_{ijt}$

Taken from Allende (2019), we can define $\delta_{jt}$ and $\mu_{ijt}$ as follows:

$$
\delta_{jt} = \beta_1 p_{jt} + \beta_2 q_{jt} + \beta_3^{\prime} X_{jt} + \beta_5\hat{z}^{x}_{jt} + \xi_{jt}
$$

$$
\mu_{ijt} = (\beta_{1i} - \beta_1) p_{jt} + (\beta^{\prime}_{3i} - \beta^{\prime}_{3}) X_{jt} + \beta_{4i}d_{ijt}
$$

##### 4. Probability that student $i$ chooses school $j$ in the market in terms of $\delta_{jt}$ and $\mu_{ijt}$

$$
s_{ijt} = \frac{\exp(\delta_{jt} + \mu_{ijt})}{\displaystyle \sum_j \exp(\delta_{jt} + \mu_{ijt})}
$$

which is the logit choice probability.

##### 5. Likelihood function

We may define a identifier for person $i$ to choose $k$ as binary. Therefore,

$$
\begin{align}
\log(\mathcal{L}) &= \sum_i \sum_j 1_{ij} s_{ijt} \\
&= \sum_i \sum_j \left( \frac{\exp(\delta_{jt} + \mu_{ijt})}{\displaystyle \sum_j \exp(\delta_{jt} + \mu_{ijt})} \right)
\end{align}
$$

#### Student Achievement

An additional piece of this model is students’ counterfactual outcomes, i.e., test scores. Each student $i$ has a counterfactual test score for every school she may attend. Specifically,

$$
Y_{ijt} = A_{it} \omega + q_{jt} + \epsilon_{ijt}, \label{choice}
$$

where $A_{it}$ is a vector of demographic characteristics of student $i$ that determine test scores, $q_{jt}$ is the value-added of school $j$, and $\epsilon_{ijt}$ is an idiosyncratic error term orthogonal to $A_{it}$ and $q_{jt}$ with zero mean and finite variance. The realised outcome for student $i$ is $\displaystyle Y_{it} = \sum_{j = 1}^J 1 \left\{ S_{it} = j \right\} Y_{ijt}$, where $S_{it} \in \{ 1, \dots, J \}$ denotes the school choice of student $i$.

##### 1. Selection on observables estimation

We know that, under selection on observables assumption, potential outcomes are independent of the school chosen, conditional on observed characteristics. In a first stage, $\hat{q}_{jt}$​ is estimated using $\ref{choice}$​. In a second stage, we may project $\hat{q}_j$ into peers and inputs plus a school fixed effect. Instrumental variables can be used to identify the effects of the student body composition on the measure for value-added. Then, we recover $\mu_{jt}$ by subtracting the predicted contribution of peers to value-added.

##### 2. Selection-corrected consistent estimation

This is taken by simulation. For each student, the simulated characteristic is obtained by integrating over the individual choice probabilities. These probabilities are functions of the demand parameters, the students’ characteristics, the students’ test scores, which define their school choice, and the prices that the student faces.

The simulation is made taking $n$ draws from the unobservables. The unobservable preferences for quality and peers are drawn from their distribution, conditional on the parameters. The selection correction is implemented using a student-specific individual posterior distribution for the preferences for schools in the network.

Recall our control function is described by the following expression:

$$
E( \epsilon_{ijt} \mid Y_{it} = 1 )
$$

#### Demand Estimation

With estimates for $\delta_{jt}$ and $q_{jt}$ in hand, we should now be able to finalise the estimation of “linear” parameters of the demand model, namely, those considered within the terms of $\delta_{jt}$.

##### 1. No endogeneity

We can estimate our parameter by OLS for $\delta_{jt}$.

##### 2. Endogeneity of $p_{jt}$ and $q_{jt}$ — instruments for these variables

For price and quality, we may consider those which, whenever there’s an increase / decrease in the price of a factor, increase / decrease costs and shift their curves upwards / downwards. Taken from Allende (2019), we fetch a set of teachers’ wages across time and within markets. We can also exploit the individual level variation on prices generated by the private vouchers’ assignment rule.

##### 3. Endogeneity of $p_{jt}$, $q_{jt}$ and $\hat{z}^x_{jt}$ — instruments for this additional variable

1. Variation in local market structure as exogenous characteristics of the other schools.
2. Variation on the local distribution of student characteristics.
3. Lagged variation in the local exposure to a teachers’ strike.

##### 4. 2SLS taking into account the endogeneity of $p_{jt}$, $q_{jt}$ and $\hat{z}^x_{jt}$

On first stage we may regress peers’ composition, costs and price shifters over price, quality and students’ composition, so we can finally regress over our demand model using these first stage estimations.

#### Supply

Schools are profit-maximisers, and compete choosing the tuition ($p_{jt}$) they charge to families in a static complete information game. We assume that schools’ marginal costs are constant, and they can be modelled as linear functions of quality, $q_{jt}$, observable characteristics, $B_{jt}$, and an unobserved shock, $\eta_{jt}$.

##### 1. Profit function of school $j$

Following Allende (2019),

$$
\pi_{jt}(\mu, p, z^x(p)) = \left( p_{jt} - MC_{jt}(q_{jt}, B_{jt}) \right) \times N_t \times s_{jt}
$$

where

$$
MC_{jt} = \gamma_q q_{jt} + \gamma_B B_{jt} + \eta_{jt} \label{MC}
$$

##### 2. First order condition of school $j$

Let $\pi_{jt} = \pi_{jt}(\mu, p, z^x(p))$. Hence,

$$
\frac{d\pi_{jt}}{d p_{jt}} = 0 \iff p_{jt} = MC_{jt} + s_{jt} \left( - \frac{d s_{jt}}{d p_{jt}} \right)^{-1} \label{derivatives}
$$

##### 3. How different are schools’ first order conditions with demand externalities relative to those with no demand externalities? Can we predict whether externalities bring up or down prices relative to prices with no demand externalities?

Following $\ref{derivatives}$, where

$$
\frac{ds_{ijt}}{dp_{jt}} = \frac{\part s_{ijt}}{\part p_{jt}} + \sum_{l \in \Omega_{it}} \frac{\part s_{ijt}}{\part z^x_{lt}} \times \frac{dz^x_{lt}}{dp_{jt}},
$$

the second term of this derivative — market share with respect to prices — depends on how sensitive is the demand relative to peers, and how much do these respond to prices. This leads us to better-fitted regressions for market share prediction as prices change, with accuracy downgrades if we do not consider them.

##### 4. Nash-Bertrand equilibrium

A Nash-Bertrand equilibrium is defined as a tuple $\displaystyle \left\{ \{z^x\}_{j \in J}, \{p\}_{j \in J}, \{\mu\}_{j \in J} \right\}$ such that:

1. $\hat{z}_i^x = z^x$, $\forall i \in I$;
2. $p^*_j(p^*_{-j}) = \arg\max_{\{p\}} \pi_j (\mu, p, p^*_{-j}, z^x(p, p^*_{-j}))$, $\forall j \in J$, and
3. $\mu^*_j(\mu^*_{-j}) = \arg\max_{\{\mu\}} \pi_j (\mu, \mu^*_{-j}, p*(\mu, \mu^*_{-j}), z^x(p^*(\mu, \mu^*_{-j})))$, $\forall j \in J$.

##### 5. Marginal cost parameter estimation

We can rewrite $\ref{derivatives}$ as follows:

$$
MC_{jt} = p_{jt} - s_{jt} \left( - \frac{d s_{jt}}{d p_{jt}} \right)^{-1},
$$

from which we can obtain relevant data on prices and externalities to approximate marginal costs. Finally, we can deploy an OLS regression over $\ref{MC}$ to estimate our parameters.
