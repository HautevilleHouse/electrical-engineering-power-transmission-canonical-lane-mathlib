import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringPowerTransmissionCanonicalLaneLean

structure PowerFlowPackage where
  busAdmittanceMatrix : Type u
  powerFlowEquations : Prop
  newtonRaphsonConvergence : Prop
  slackBusSpecified : Prop
  pvBusReactiveLimits : Prop

structure PowerFlowEvidence (P : PowerFlowPackage) where
  busAdmittanceMatrixClosed : P.busAdmittanceMatrix
  powerFlowEquationsClosed : P.powerFlowEquations
  newtonRaphsonConvergenceClosed : P.newtonRaphsonConvergence
  slackBusSpecifiedClosed : P.slackBusSpecified
  pvBusReactiveLimitsClosed : P.pvBusReactiveLimits

def PowerFlowClosed (P : PowerFlowPackage) : Prop :=
  P.busAdmittanceMatrix ∧ P.powerFlowEquations ∧
  P.newtonRaphsonConvergence ∧ P.slackBusSpecified ∧
  P.pvBusReactiveLimits

theorem power_flow_closed_from_evidence (P : PowerFlowPackage) (E : PowerFlowEvidence P) :
    PowerFlowClosed P := by
  exact And.intro E.busAdmittanceMatrixClosed
    (And.intro E.powerFlowEquationsClosed
      (And.intro E.newtonRaphsonConvergenceClosed
        (And.intro E.slackBusSpecifiedClosed
          E.pvBusReactiveLimitsClosed)))

end ElectricalEngineeringPowerTransmissionCanonicalLaneLean
end HautevilleHouse