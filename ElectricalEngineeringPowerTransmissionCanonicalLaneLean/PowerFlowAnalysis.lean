import HautevilleHouse.ElectricalEngineeringPowerTransmissionCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure PowerFlowPackage where
  networkTopology : Type u
  busAdmittanceMatrix : Type v
  slackBusDefined : Prop
  powerBalanceEquations : Prop
  numericalSolverConverges : Prop

structure PowerFlowEvidence (P : PowerFlowPackage) where
  slackBusDefinedClosed : P.slackBusDefined
  powerBalanceEquationsClosed : P.powerBalanceEquations
  numericalSolverConvergesClosed : P.numericalSolverConverges

def PowerFlowClosed (P : PowerFlowPackage) : Prop :=
  P.slackBusDefined ∧ P.powerBalanceEquations ∧ P.numericalSolverConverges

theorem power_flow_closed_from_evidence (P : PowerFlowPackage) (E : PowerFlowEvidence P) : PowerFlowClosed P := by
  exact And.intro E.slackBusDefinedClosed (And.intro E.powerBalanceEquationsClosed E.numericalSolverConvergesClosed)

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse