import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure OptimalPowerFlow where
  objectiveFunction : ℝ → ℝ
  constraints : Prop
  generatorDispatch : ℝ → ℝ
  locationalMarginalPrices : ℝ → ℝ
  optimalityConditions : Prop
  dualityGap : ℝ
  solutionConverged : Prop
  primalFeasible : Prop
  dualFeasible : Prop

structure OptimalPowerFlowEvidence (O : OptimalPowerFlow) where
  optimalityConditionsClosed : O.optimalityConditions
  solutionConvergedClosed : O.solutionConverged
  primalFeasibleClosed : O.primalFeasible
  dualFeasibleClosed : O.dualFeasible

def OptimalPowerFlowClosed (O : OptimalPowerFlow) : Prop :=
  O.optimalityConditions ∧ O.solutionConverged ∧ O.primalFeasible ∧ O.dualFeasible

theorem optimal_power_flow_closed_from_evidence (O : OptimalPowerFlow) (E : OptimalPowerFlowEvidence O) :
    OptimalPowerFlowClosed O := by
  exact And.intro E.optimalityConditionsClosed (And.intro E.solutionConvergedClosed (And.intro E.primalFeasibleClosed E.dualFeasibleClosed))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse